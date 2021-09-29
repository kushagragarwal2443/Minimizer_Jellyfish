/*  This file is part of Jellyfish.

    This work is dual-licensed under 3-Clause BSD License or GPL 3.0.
    You can choose between one of them if you use this work.

`SPDX-License-Identifier: BSD-3-Clause OR  GPL-3.0`
*/


#ifndef __MER_ITERATOR_HPP__
#define __MER_ITERATOR_HPP__

#include <iterator>
#include <jellyfish/mer_dna.hpp>

namespace jellyfish {
template<typename SequencePool, typename MerType>
class mer_iterator : public std::iterator<std::input_iterator_tag,MerType> {
  typename SequencePool::job* job_;
  const char*                 cseq_;
  MerType                     m_; // mer
  MerType                     rcm_; // reverse complement mer
  unsigned int                filled_;
  const bool                  canonical_;
  uint32_t                    read_number = 0; //Souvadra's addition
  uint64_t                    kmer_int[2] = {0,0}; // Souvadra's addition
  uint64_t                    mask1 = (1ULL<<2 * m_.k()) - 1; // Souvadra's addition
  uint64_t                    shift1 = 2 * (m_.k()-1); // Souvadra's addition
  bool                        should_skip = false; // Souvadra's addition 
public:
  typedef MerType      mer_type;
  typedef SequencePool sequence_parser_type;

  mer_iterator(SequencePool& seq, bool canonical = false) :
    job_(new typename SequencePool::job(seq)), cseq_(0), filled_(0), canonical_(canonical)
  {
    if(job_->is_empty()) {
      delete job_;
      job_ = 0;
    } else {
      cseq_ = (*job_)->start;
      this->operator++();
    }
  }
  mer_iterator() : job_(0), cseq_(0), filled_(0), canonical_(false) { }
  //  mer_iterator(const mer_iterator& rhs) : job_(rhs.job_), cseq_(rhs.cseq_), m_(rhs.m_), filled_(rhs.filled_) { }
  ~mer_iterator() {
    delete job_;
  }

  bool operator==(const mer_iterator& rhs) const { return job_ == rhs.job_; }
  bool operator!=(const mer_iterator& rhs) const { return job_ != rhs.job_; }

  operator void*() const { return (void*)job_; }
  const mer_type& operator*() const { return !canonical_ || m_.get_kmer_int() < rcm_.get_kmer_int() ? m_ : rcm_; } // Souvadra's modification
  const mer_type* operator->() const { return &this->operator*(); }
  mer_iterator& operator++() {
    while(true) {
      while(cseq_ == (*job_)->end) {
        job_->next();
        if(job_->is_empty()) {
          delete job_;
          job_  = 0;
          cseq_ = 0;
          return *this;
        }
        cseq_   = (*job_)->start;
        should_skip = true; // Souvadra's addition
        filled_ = 0;
      }

      do {
        int code = m_.code(*cseq_++);
        if(code >= 0) {
          m_.shift_left(code);
          if(canonical_){
            rcm_.shift_right(rcm_.complement(code));
          }
          filled_ = std::min(filled_ + 1, mer_dna::k());

          kmer_int[0] = (kmer_int[0] << 2 | code) & mask1; // forward k-mer // Souvadra's addition
          if (canonical_) kmer_int[1] = (kmer_int[1] >> 2) | (3ULL^code) << shift1; // reverse k-mer // Souvadra's addition
          // if (filled_ == 1)
          // {
          //   read_number += 1;
          // }
        } else {
            // std::cout << "HELLU FROM THE INSIDE " << filled_ << std::endl;
            should_skip = false; //New read hence we shouldnt skip any
            read_number += 1; 
            filled_ = 0;
        }
      } while(filled_ < m_.k() && cseq_ < (*job_)->end);
      
      if(filled_ >= m_.k())
      {
        m_.set_skip(should_skip);
        m_.set_rid(read_number);
        m_.set_kmer_int(kmer_int[0]);
        m_.set_strand(0);
        if (canonical_) {
          //Might need to set skip for rcm as well
          rcm_.set_skip(should_skip);
          rcm_.set_rid(read_number); 
          rcm_.set_kmer_int(kmer_int[1]);
          rcm_.set_strand(1); 
        }
        should_skip = false;
        break;
      }
      
    }

    #if 0
    m_.alter_it();
    #endif 
    return *this;

  }

  mer_iterator operator++(int) {
    mer_iterator res(*this);
    ++*this;
    return res;
  }
};

} // namespace jellyfish {

#endif /* __MER_ITERATOR_HPP__ */
