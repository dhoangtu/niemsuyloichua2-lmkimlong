% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hãy Trở Lại"
  poet = "Ý lời ca: Is 15, 15, 6b-7 + 18, 21-26"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  a8 f f d |
  g4. a8 |
  g a e f |
  d4 e8 f |
  f d d c |
  c4. g'8 |
  a a e g |
  f2 \bar "||"
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f4 e8 g |
  a2 ~ |
  a8 [bf] c c \break
  f, f f (g) |
  a4. a8 |
  a c g g |
  f2 ~ |
  f4 r \bar "|."
}

nhacPhanBa = \relative c' {
  \key f \major
  \time 2/4
  \skip 2
  r8 d c d |
  f g f e |
  d8 d d (c) |
  f4. f8 |
  f a bf, c |
  a2 ~ |
  a4 r
}

% Lời
loiPhanMot = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hãy trở lại cùng Ta
      các ngươi sẽ được cứu độ.
      Ta lấy chính Danh Ta mà thề,
      không có Chúa nào khác đâu!
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
	    Chúa tạo dựng càn khôn,
	    các tinh tú và núi đồi,
	    bao suối mát, sông sâu biển rộng,
	    Đây Chúa đến giải thoát ngươi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
	    Các tầng trời đổ mưa
	    Hỡi sương hãy vội gieo hạt
	    xin trái đất nhanh chai mở rộng
	    Mưa Đấng Cứu Độ gian trần.
    }
  >>
}

loiPhanHai = \lyricmode {
  Ta là Thiên Chúa
  dựng nên tai họa và hạnh phúc,
  ánh sáng và bóng tối tăm.
}

loiPhanBa = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  Ta là Thiên Chúa
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
    \override Lyrics.LyricSpace.minimum-distance = #0.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}

\score {
  \new ChoirStaff \with {
    \override StaffGrouper.staff-staff-spacing = #'(
                            (basic-distance . 14)
                            (padding . 1))
  }
  <<
    \new Staff \with {
        printPartCombineTexts = ##f
      }
      <<
      \new Voice \partCombine 
        \nhacPhanHai
        \nhacPhanBa
      \new NullVoice = nhacThamChieuSop \nhacPhanHai
      \new Lyrics \lyricsto nhacThamChieuSop \loiPhanHai
      \new NullVoice = nhacThamChieuAlto \nhacPhanBa
      \new Lyrics \lyricsto nhacThamChieuAlto \loiPhanBa
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
