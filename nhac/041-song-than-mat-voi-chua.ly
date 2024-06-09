% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Sống Thân Mật Với Chúa"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  f e f (g) |
  a4. bf8 |
  bf a g4 |
  c2 |
  bf8 bf bf d |
  g,4 g8 e |
  g e d c |
  g'4 g8 g |
  f2 ~ |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 a8 |
  a f bf bf |
  bf4. bf8 |
  a g c c |
  c4. bf8 |
  d bf c a |
  g4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Người môn đệ của Chúa muốn bước đi cùng Chúa
  phải từ bỏ chính mình,
  sống trong mối tương quan mật thiết với Chúa luôn.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Muốn sống mật thiết với Chúa
      hãy luôn tìm thánh ý Chúa và quyết thực thi vuông tròn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Muốn sống mật thiết với Chúa
      hãy thể hiện đức bác ái, vì Chúa mà yêu muôn người.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Muốn sống mật thiết với Chúa
      hãy trở thành những chứng tá làm sáng rực lên Tin Mừng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Muốn sống mật thiết với Chúa
      hãy yêu Hội Thánh thắm thiết để khắp mọi nơi nên một.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.5
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
