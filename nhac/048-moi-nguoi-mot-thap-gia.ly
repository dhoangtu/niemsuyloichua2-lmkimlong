% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Mỗi Người Một Thập Giá"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f16 (g) |
  e8 e g f |
  bf2 ~ |
  bf8 c c d |
  bf8. bf16 c8 d |
  g,4 r8 a |
  g g f a |
  e8. d16 e8 d |
  c a' g g |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  e a d bf |
  bf4. g16 (a) |
  f8 f g e |
  d4 d8 c |
  f8. f16 e8 g |
  a4. bf8 |
  a a g c |
  f,4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Mỗi người một cây thập giá,
  Ta đâu có chọn lựa theo ý mình,
  Chúa trao cây thập giá nào ta hãy vui lòng vác đi theo Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Thân phận mỗi người mỗi khác
      cảnh vực đời chẳng tương đồng,
      nhưng một khi đoan nguyện theo Chúa
      hãy luôn tuân phúc ý Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ai người muốn gặp khốn khó,
      chẳng cầu được sống an lành,
      nhưng đời đâu muôn điều như ý,
      có đâu luôn được mãn nguyện.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Âm thầm đón nhận ý Chúa,
      tín nhiệm bàn tay quan phòng,
      xin Ngài luôn ân cần đưa lối đến nơi hoan lạc vĩnh hằng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Thông phần uống cạn chén đắng,
      Phép Rửa Ngài ta cam chịu.
      Leo đồi Can -- vê cùng bước tới sẽ chung vinh hiển với Ngài.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.7
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
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
