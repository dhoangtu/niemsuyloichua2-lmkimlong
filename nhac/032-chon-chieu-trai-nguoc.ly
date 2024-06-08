% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chọn Chiều Trái Ngược"
  poet = "Ý lời ca: Mt 11, 12 + 5, 3-12"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f8 e e a |
  d,4 g8 c, |
  c4 c8 g' |
  g2 ~ |
  g8 g f e |
  a8. bf16 bf8 a |
  g4 c8 f, |
  f4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a8 f |
  g8. g16 f8 e |
  e4 e8 a |
  d,4. e8 |
  e d16 (e) d8 d |
  c4 c8 c |
  a'4 g8 f |
  g4 f8 e |
  e4. d8 |
  c g' g f |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Con đường vào Nước Trời rất chật hẹp, nhiều gian nan,
  Nên phải mạnh mẽ chiến đấu can trường mới vào được.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Có nhiều khi ta phải chọn lựa
      chiều trái ngược với những giá trị gian trần:
      Chọn nghèo khó hơn giầu sang,
      Chọn hiền lành hơn là dũng mãnh hiên ngang.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Có nhiều khi ta phải chọn lựa
      chiều trái ngược với những giá trị gian trần:
      Chọn buồn khóc hơn cười vui,
      khinh lợi lộc, nên hằng khát ước công bình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Có nhiều khi ta phải chọn lựa
      chiều trái ngược với những giá trị trần gian:
      Chọn tình nghĩa hơn hờn căm,
      ưa vẹn sạch để nhìn ngắm Chúa vinh quang.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Có nhiều khi ta phải chọn lựa
      chiều trái nược hơn những giá trị gian trần:
      Luôn tận sức gây bình an,
      không sợ sệt nên vì Nước Chúa hy sinh.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Thế vậy nên không thể thành tựu nhờ sức mình,
      nên ta phải luôn nương nhờ quyền lục Chúa bang trợ cho.
      Trong mọi việc nhờ Ngài sẽ rất hanh thông.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
