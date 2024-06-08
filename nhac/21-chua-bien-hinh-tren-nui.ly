% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Biến Hình Trên Núi"
  composer = "Lm. Kim Long"
  poet = "Ý lời ca: Từ Mc 9, 2-28"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f8 f e g |
  a4. a8 |
  a a g e |
  f g d f |
  e d c4 ~ |
  c8 e16 (f) g8 f |
  e8. e16 a8 a |
  d, f bf c |
  f,2 ~ |
  f8 \bar "||"
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8
  <<
    {
      g |
      a2 |
      a8 a f f |
      bf2 |
      bf8 bf a a |
      c4 c8 a |
      bf c c e, |
      f2 ~ |
      f4 r8 \bar "|."
    }
    {
      e8 |
      f2 |
      f8 f ef ef |
      d2 |
      g8 g f f |
      e4 a8 f |
      d d c c |
      a2 ~ |
      a4 r8
    }
  >>
}

% Lời
loiPhanMot = \lyricmode {
  <<
    {
      \set stanza = "1."
      Đưa môn đệ lên núi
      Chúa muốn các môn đệ tạm xa trần thế muôn bộn bề
      để sống thân mật truyện vãn với Ngài, để chiêm ngắm Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
	    Bao nhiêu lần tển núi
	    Chúa muốn những ai nhận mang sứ vụ đến cho dân Ngài
	    phải lắng nghe Ngài dạy dỗ thấu triệt để loan báo lại.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
	    Bao nhiêu ngày trên núi
	    Chúa mới xuống quy tụ đoàn môn đệ với dân cư lại
	    để ban cho họ từng mối phúc thật của vương quốc Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
	    Ta mau cùng lên núi:
	    Đến với Chúa trong lặng thinh,
	    có Ngài với ta tâm sự để ta hiểu được:
	    Đường Thánh Giá, đường dẫn lên cõi trời.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
	    Ta e ngại lên núi?
	    Có Chúa dẫn ta cùng lên
	    sẽ được ngắm trông tỏ tường,
	    để ánh quang Ngài dọi chiếu mở lòng nghe Cha phán dạy.
    }
  >>
}

loiPhanHai = \lyricmode {
  Kìa trên núi Chúa biến hình rạng rỡ,
  Tiếng Chúa Cha tuyên phán:
  ''Đây là Con Chí Ái của Ta''.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
