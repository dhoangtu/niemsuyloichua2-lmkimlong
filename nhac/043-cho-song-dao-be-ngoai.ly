% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chớ Sống Đạo Bề Ngoài"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  a8 a e ef |
  d4. d8 |
  c e g bf |
  a4 bf8 bf |
  bf8. g16 c8 c |
  c4. c8 |
  bf c g c |
  f,2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  e8 e a d, |
  d4 f8 f |
  e f d g |
  c,2 |
  c8 d f a |
  g4. bf8 |
  bf bf g c |
  f,2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chớ sống đạo bề ngoài, nhưng từ nội tâm thẳm sâu,
  Có Chúa biết và sống với Chúa,
  Tâm sự thân tình với Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Vào phòng chốt cửa lại để chẳng còn ai nhìn thấy được
      Trò truyện cùng Chúa đi Chúa lắng tiếng và đáp lời.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Nhìn kìa Chúa một mình vô hoang địa
      thinh lặng khấn cầu,
      Và nguyện thỉnh ý Cha trước mỗi lúc cần quyết định.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Rửa sạch sẽ bề ngoài nhưng trong lòng ắp đầy ác độc
      Thì nào lọi ích chi?
      Trước hết tẩy luyện cõi lòng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Chẳng hề nói một lời Giu -- se làm theo lệnh sứ thần
      Nhận nhiệm vụ tối cao: Trông côi Con Một Chúa Trời.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Kìa vào lúc chiều về, cho môn đệ xếp lại các việc
      Một phần để nghỉ ngơi, phần khác tĩnh lặng khấn cầu.
    }
  >>
}

% Dàn trang
\paper {
  #(set-paper-size "a5")
  top-margin = 3\mm
  bottom-margin = 3\mm
  left-margin = 3\mm
  right-margin = 3\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Deja Vu Serif Condensed"
	 		       "Deja Vu Serif Condensed"
			       "Deja Vu Serif Condensed"
			       (/ 20 20)))
  print-page-number = ##f
}

\score {
  <<
    \new Staff <<
        \clef treble
        \new Voice = beSop {
          \nhacPhanMot
        }
      \new Lyrics \lyricsto beSop \loiPhanMot
    >>
  >>
  \layout {
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}

\score {
  <<
    \new Staff <<
        \clef treble
        \new Voice = beSop {
          \nhacPhanHai
        }
      \new Lyrics \lyricsto beSop \loiPhanHai
    >>
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
