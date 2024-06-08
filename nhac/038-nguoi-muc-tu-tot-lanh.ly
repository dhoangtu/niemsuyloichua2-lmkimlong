% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Người Mục Tử Tốt Lành"
  poet = \markup \left-column {
    "Ý lời ca: Từ một bài chia sẻ"
    "của Đức Phanxicô"
  }
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f8 f f16 (g) a8 |
  d,2 |
  f8 e f d |
  g4 f8 bf |
  bf8. g16 g8 bf |
  bf4. bf8 |
  g a e g16 (a) |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 f d e |
  e4 c8 c |
  e16 (f) g8 f e |
  a8. bf16 g8 c |
  c4. bf8 |
  g bf c c |
  f,2 ~ |
  f4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Người mục tử tốt lành
  Hãy chăm sóc đoàn chiên vì mến Chúa
  và cùng với Chúa vác thập giá mình mỗi ngày.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hãy bỏ lại sau lưng mọi rào cản khiến xa lìa Chúa,
      cách biệt anh em, chẳng còn nhân ái nghĩa tình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Hãy chấp nhận hy sinh bằng lòng để chấp nhận thử thách
      giữa ngàn khốn khó dẫu phải trao hiến tính mạng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Hãy mẫu mực nêu gương và bền vững dấn thân vì Chúa,
      chấp nhận mọi thách đố để đoàn chiên tiến tới hoài.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.7
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
