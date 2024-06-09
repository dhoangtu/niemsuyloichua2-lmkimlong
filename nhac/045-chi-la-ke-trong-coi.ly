% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chỉ Là Kẻ Trông Coi"
  poet = "Ý lời ca: Từ Mt 21. 23"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  a a f d |
  g2 |
  g8 e e16 (d) g8 |
  c,8. c16 e8 f |
  g4 g16 (a) g8 |
  g8. g16 g8 bf |
  c c g16 (c) g8 |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 a g d16 (e) |
  c8 c e16 (f) g8 |
  g2 |
  a8 g f a |
  bf8. bf16 g8 bf |
  c4. bf8 |
  bf c a16 (g) e8 |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Mạng sống, sức khỏe, tài năng Chúa trao cho mỗi người
  là để trông coi.
  Hãy tận dụng mà làm trổ sinh hoa quả thêm nhiều.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Đừng nghĩ suy chiếm đoạt làm của tư riêng.
      Hãy sinh lời thêm mãi,
      trao lại cho Chúa, để được lãnh thưởng đời sau.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Đừng có kiêu ngạo vì là chẳng ai hơn,
      Cứ đưa mình lên mãi, quên phận tôi tớ,
      Vì là những công cụ thôi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Từng phút giây hãy thực thành khẩn kêu xin
      Chúa mở lượng nhân ái
      tác động thêm mãi hoàn thành những việc được trao.
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
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
