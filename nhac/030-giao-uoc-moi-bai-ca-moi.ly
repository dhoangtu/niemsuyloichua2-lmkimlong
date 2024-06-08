% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Giao Ước Mới - Bài Ca Mới"
  poet = "Ý lời ca: Từ thánh Augustinô"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f8 (g) d c |
  a'8. f16 f8 a |
  bf4 bf8 c |
  c4 bf8 a |
  d4 g,8 a |
  bf2 |
  c8 bf d g, |
  g2 |
  g8 e f d |
  a'4. c8 |
  c g g f |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 f e e |
  e4. d8 |
  c g'4 g8 |
  a4 r8 bf |
  bf bf d c |
  g4 g8 g |
  e8 d16 e c8 g' |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hát lên mừng Chúa một bài ca mới.
  Giao ước mới, con người mới, bài ca mới
  Không chỉ hát bằng miệng
  Nhưng bằng cả đời sống, và bằng những tiếng reo vui.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hãy hát sao cho hay, cho vừa tai Thiên Chúa
      Ngài là nghệ sĩ điêu luyện sẽ lắng nghe,
      nên nhớ đừng hát sai.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Hát hết tâm can ta trong tình yêu tha thiết,
      bằng một đời sống chân thành,
      tiếng thiết tha khi cõi lòng sướng vui.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Tiếng hát ngân vang xa theo nhịp ta thương mến
      hợp lời cùng với muôn người
      sẽ vút bay lên cõi trời thánh thiêng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Xóa hết bao đau thương, thay bằng muôn vui sướng,
      người cùng nhịp bước theo người,
      sát cánh nhau gieo ấm nồng khắp nơi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Thánh thót ta reo vui khi lời không lên tiếng,
      một triều hạnh phúc tuôn trào
      cứ ngước trông âm sắc đẹp biết bao.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "6."
      \override Lyrics.LyricText.font-shape = #'italic
      Đón lấy muôn ơn thiêng trau dồi ta nên mới,
      tập luyện hoài khúc ca này
      Chúa lắng nghe ưng ý là vỗ tay.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
