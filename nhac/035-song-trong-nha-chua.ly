% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Sống Trong Nhà Chúa"
  poet = "Ý lời ca: Từ Lc 15, 11-31"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key d \major
  \time 2/4
  \partial 4 fs8 fs |
  fs4 fs8 g |
  fs4 e |
  a4. g8 |
  g fs a a |
  b4. g8 |
  a cs,8 e d |
  d2 ~ |
  d4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key d \major
  \time 2/4
  \partial 4 fs8 e |
  a4. a8 |
  b e,4 g8 |
  fs4. fs8 |
  e g a a |
  e e16 e e8 g |
  fs8. e16 e8 g |
  a4 r8 a |
  fs g e e |
  g4. gs8 |
  a cs,4 e8 |
  d2 ~ |
  d4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Xin cho con khi sống trong nhà Chúa
  cảm nghiệm lòng cha nhân ái và nghĩa tình với anh em.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Đây người Cha thương mến từng đứa con:
      Con nào ở luôn trong nhà thì ''mọi sự của Cha đều là của con''.
      Con nào hoang đàng lầm lỗi thì đón đợi thứ tha.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Đây người anh luôn sống cùng với cha
      Nhưng mà chẳng quan tâm gì
      ngày từng ngày cứ trôi bình thản như không,
      giống như những kẻ tạm trú chẳng thấu triệt ý cha.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Đây người em ham thích tìm thú vui
      Nên vội xin cha chia phần sản nghiệp
      và trẩy xa mặc tình ăn chơi.
      Khi tiêu hết bị cực khổ vùng đứng về với cha.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Đây ngày vui trong yến tiệc hát ca
      cha hiền bảo anh vô nhà và cùng mừng rỡ đi,
      đoàn tụ bên nhau chung một mái nhà đầm ấm,
      thật nghĩa tình biết bao.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
