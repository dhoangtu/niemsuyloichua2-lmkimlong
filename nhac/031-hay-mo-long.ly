% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hãy Mở Lòng"
  poet = \markup \left-column {
    "Ý lời ca: Từ một bài giảng"
    "của Đức Phanxicô"
  }  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a8 g16 (a) |
  f4 f8 g16 (a) |
  e4 d8 e16 (f) |
  c4 r8 f |
  e f e16 (f) c8 |
  g'2 ~ |
  g8 c c e, |
  e4 e8 g |
  f4 \bar "||"
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f16 (g) e (f) |
  d8 a' f f |
  bf8. bf16 bf8 d |
  g,4 r8 bf |
  a4 c8 g |
  g c e,16 (f) c8 |
  a'4 g8 e |
  f2 ~ |
  f4 \bar "|."
}

% Lời
loiPhanMot = \lyricmode {
  <<
    {
      \set stanza = "1."
      Muốn chữa lành cần hoán cải, cần mở lòng.
      Muốn ai đó mở lòng ra hãy sống hiền lành và khiêm nhường.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
	    Muốn đón nhận sự mở lòng,
	    cần sống nghèo, không cần bao bị, tiền túi
	    hãy nhớ cầm gậy và lên đường.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
	    Không mải tìm thu sữa cừu hoặc lông cừu,
	    nhưng là lo giảng Lời Chúa:
	    Nước Chúa đến gần, nào quay về.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
	    Hết thảy đều cùng ngưỡng vọng và đón nhận
	    ai người thể hện Lời Chúa
	    biết sống hiền lành và khiêm nhường.
    }
  >>
}

loiPhanHai = \lyricmode {
  Hãy mở lòng đón nhận Lời Chúa để được chữa lành.
  Nếu không sẽ chỉ là lớp vỏ hào nhoáng bên ngoài thôi.
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
  page-count = 1
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
