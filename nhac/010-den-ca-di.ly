% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Đến Cả Đi"
  poet = "Ý lời ca: Is 55, 1-11"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  g8 g e e |
  f4
  <<
    {
      a8 a |
    }
    {
      c,8 cs
    }
  >>
  <<
    {
      \voiceOne
      d4 (f) |
    }

    \new Voice = "splitpart" {
      \voiceTwo
      d4. (c8)
    }
  >>
  \oneVoice
  <<
    {
      g'2 |
      c8 c c4 |
      b2 |
      b8 c d a |
      a4. a8 |
      a g d g |
    }
    {
      b,2 |
      e8 e fs4 |
      g2 |
      g8 a g g |
      f4. f8 |
      f c b b |
    }
  >>
  c2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  e16 (f) d8 c e |
  f4. g8 |
  f f d4 |
  d2 |
  a'16 (b) b8 a g |
  c c16 (d) b8 b |
  e8. a,16 a8 a16 (c) |
  g2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hỡi những ai đang khát, hãy đến cả đi
  Nước đã sẵn đây
  Dù không có tiền bạc cứ đến mua mà hưởng dùng.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Đến mua rượu mua sữa không phải trả đồng nào.
      Hãy lắng nghe lời Ta sẽ được thưởng thức cao lương mĩ vị.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Hãy đi tìm Thiên Chúa khi còn được gặp Ngài
      Hãy khấn xin cùng Chúa lúc Ngài nhìn tới nên đang ở gần.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Hỡi ai người gian ác hãy mau mau trở về,
      Hãy trở về cùng Chúa, những lòng còn vẫn cưu mang ác tà.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa vô cùng nhân ái thứ tha muôn tội tình.
      Bởi tư tưởng cúa Chúa trổi vượt người thế phiêu linh cõi trần.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Cũng như là mưa tuyết khi đổ tuôn từ trời
      Chẳng quay lui về nếu đất và cành lá chưa tươi tốt lại.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "6."
      \override Lyrics.LyricText.font-shape = #'italic
      Những chi miệng Ta phán Ta chẳng thu hồi về
      Nếu chưa đem lại hết những gì lợi ích như Ta ấn định.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
