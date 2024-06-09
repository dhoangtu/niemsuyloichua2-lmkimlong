% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Cầm Nến Cháy Sáng Đón Chúa"
  poet = \markup \left-column {
    "Ý lời ca: Thánh Xôprôniô"
    "Bài đọc Kinh Sách"
  }
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  f8. f16 f8 e |
  e4 f8 e |
  d g g a |
  a4. g16 (a) |
  f8 f bf bf |
  g4 d'8 d |
  c4 bf8 g |
  g bf c e, |
  f2 ~ |
  f4 r \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  e8 f g g |
  g8. g16 f8 bf |
  bf4 c8 d |
  d2 |
  bf8 bf c d |
  g,8. g16 e (d) g8 |
  c, c e g |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Cầm nến cháy sáng trong tay,
  chúng ta cùng hân hoan đón Chúa
  Bởi Ngài là ánh sáng thật đến chiếu soi
  những người ngồi trong bóng tử thần.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Kìa Mẹ Ma -- ri -- a đang bồng ẵm Chúa đem ánh sáng
      Tựa hừng đông xuất hiện chiếu soi những người
      chìm trong bóng đêm.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Cùng cụ Si -- mê -- on xin được ẵm Chúa dâng tiếng hát
      Ngợi mừng ơn cứu độ tháng năm đón chờ rầy thăm viếng ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Lòng hỷ hoan bên nhau tay cầm nến sáng, ta cất bước
      Nguyện lòng luôn sáng ngời
      giống cây nến này rạng soi khắp nơi.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
