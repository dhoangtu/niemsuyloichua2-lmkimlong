% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Dự Tiệc Thánh Thể Mỗi Ngày"
  poet = "Ý lời ca: Từ Mt 9, 14-15"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f8 e16 (f) d8 g |
  g4 e8 a |
  a2 ~ |
  a8 f f f |
  bf8. a16 a8 g |
  c4 c8 bf |
  bf d a16 (g) c8 |
  f,2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  e8 e e e |
  a4. e8 |
  f g e d |
  c4 r8 c |
  c e16 (f) d8 g |
  g4. g8 |
  e d d16 (e) c8 |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa ở gần ta đây, tràn yêu thương,
  Nào cùng Hội Thánh,
  Tân Nương của Chúa tham dự tiệc Thánh Thể mỗi ngày.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Được dự tiệc Thịt Máu, tiệc ân phúc, ôi nhiệm mầu,
      cùng mừng rỡ mà reo lên,
      sống vui năm tháng bình yên.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Vào bàn tiệc Lời Chúa, niềm vui sẽ thêm chan hòa,
      Từng Lời chỉ đường quang minh dẫn lên vinh phúc trường sinh.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Họp mặt cùng thần thánh và bên Mẫu thân nhân lành,
      Nào cùng vũ trụ muôn nơi, tán dương vinh phúc chẳng ngơi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Rồi ngày buồn chợt tới, một khi Chúa ra đi rồi,
      Nào cùng khẩn cầu, ăn chay, ngước trông lên Núi Sọ ngay.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
