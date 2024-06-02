% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Đến Với Chúa"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 4. e8 a g |
  g8. g16 g8 f |
  e a d, d |
  d4 f8 d |
  d g g c, |
  c4 r8
  <<
    {
      e8 |
      e c f f |
      f8. e16 d8 a' |
      a4. e'8 |
    }
    {
      c,8 |
      c a d d |
      d8. c16 b8 a |
      f'4. e8 |
    }
  >>
  <<
    {
      \voiceOne
      a16 (b) d8
    }

    \new Voice = "splitpart" {
      \voiceTwo
      f,8 f
    }
  >>
  \oneVoice
  <<
    {
      d'8 d |
      c4 \bar "|."
    }
    {
      f,8 f |
      e4
    }
  >>
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4 c8 c |
  c4. c8 |
  g a d, f |
  e2 |
  g8 g e d |
  d2 |
  g8 g c, d |
  e2 ~ |
  e8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Tự sức riêng con, con không thể gồng gánh nặng hằng ngày,
  không chịu được cái ách cuộc đời,
  Nên con cần đến với Chúa theo lời Chúa phán:
  ''Tất cả hãy đến với Ta''.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Đến với Chúa, Chúa tăng sức bồi dưỡng cho,
      gánh sẽ nên nhẹ nhàng, ách sẽ thành êm ái.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Đến với Chúa, giống cành gắn liền với cây,
      sẽ hút nhựa dồi dào sẽ kết nhiều hoa trái.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Đến với Chúa, lãnh thêm sức mạnh Thánh Linh,
      vững bước trên đường đời vẫn quá nhiều nguy khó.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Đến với Chúa, chính ngài sẽ dạy dỗ ta,
      luôn khiêm nhượng hiền lành giống cách ngài gương mẫu.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
