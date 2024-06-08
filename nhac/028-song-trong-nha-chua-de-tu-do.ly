% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Sống Trong Nhà Chúa Để Tự Do"
  poet = \markup \left-column {
    "Ý lời ca: Từ một bài suy niệm"
    "của Đức Phanxicô"
  }
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  a8 a g f |
  a8. f16 d8 d |
  g4. f8 |
  bf4 c8 c |
  c4. c,8 |
  e g g f |
  f2 ~ |
  f4 \bar "||"
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 e8 |
  g4 a8 a |
  a4. f8 |
  e a4 e8 |
  d4. f16 (e) |
  a8 a f bf |
  bf4 bf8 g |
  c c16 c bf (g) e8 |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy sống trong nhà Chúa để được tự do,
  Tự do đến với Chúa,
  Tự do đến với anh em.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Tự do đến với Chúa để truyện vãn thân tình
      để biết những gì Chúa muốn,
      nhất là biết Chúa muốn ta làm chi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Tự do nói với Chúa chẳng sợ hãi ngại ngùng
      mở toang tâm hồn với Chúa:
      Những nguyện ước với biết bao mộng mơ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Tự do sống đức ái khi nhìn Chúa
      tỏ hiện ở những tiếng cười tiếng khóc,
      ai hạnh phúc, với những ai sầu đau.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Tự do sống tín thác bởi lòng Chúa nhân hiền
      cảm thấu hết mọi khúc mắc khi lệ đắng, lúc hé nụ cười tươi.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
