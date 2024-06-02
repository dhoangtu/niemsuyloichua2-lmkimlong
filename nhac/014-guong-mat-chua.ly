% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Gương Mặt Chúa"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 f |
  e f d d |
  d4. d8 |
  c c f e |
  a4. g8 |
  a f a g |
  bf2 |
  bf8 bf g c |
  c4. g8 |
  a c, c g' |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 e e a |
  \grace { d,16 (e } d4) d8 c |
  c f e (f) |
  g4. bf8 |
  c c, g' a |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Khi khiêm nhường quên mình phục vụ
  ta nhìn được gương mặt Chúa nơi những người ta gặp gỡ.
  Nếu hết mình giúp đỡ, ta sẽ phục vụ Chúa luôn.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Khi làm việc bé nhỏ cho một người cơ khổ đây
      như đã làm cho Chúa vậy.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Đem một giọt nước lạnh cho một người đang họng khô
      ta thể hiện nhân đức rồi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chung dặm đường trắc trở bên một người đang lẻ loi,
      ta đã cùng đi với Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi bằng lòng hé cửa cho một người xin ẩn thân:
      Ta đón Ngài thăm viếng nhà.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
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
