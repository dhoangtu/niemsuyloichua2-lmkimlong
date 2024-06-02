% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Reo Vui Lên"
  composer = "Lm. Kim Long"
  poet = "Ý lời ca: Xp 3, 13-20"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  a8 a f g |
  a8. g16 d (f) d8 |
  c4 r8 f |
  e (f) g a |
  a8. g16 g8 g |
  c4 r8 bf |
  d d g, bf |
  a4 f8 a |
  e g g4 |
  d8 e e16 (d) c8 |
  f2 ~ |
  f4 r8 \bar "||"
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8
  <<
    {
      a8 |
      a a bf a |
      g4 f8 bf |
      g8. g16 g8 g |
      a4 a8 f |
      g8. a16 a8 a |
      d,4 d8 c |
      g'8. a16 a8 e |
      f2 \bar "|."
    }
    {
      f8 |
      f f g f |
      e4 d8 d |
      e8. e16 e8 e |
      f4 f8 d |
      e8. d16 cs8 cs |
      d4 bf8 a |
      bf8. bf16 c8 c |
      a2
    }
  >>
}

% Lời
loiPhanMot = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hãy đến gần Thiên Chúa, tin tưởng nơi Ngài.
      Kêu cầu danh thánh Chúa và phụng sự Chúa
      Tội lỗi sẽ được thứ tha
      và sẽ được vinh quang trên núi thánh Ngài liên.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
	    Chớ khiếp sợ chi, chớ kinh hãi rụng rời,
	    bởi vì đây có Chúa ngự trị hiển hách.
	    Và Đấng Cứu Độ của ngươi thật dũng mạnh uy phong
	    vui sướng bởi vì ngươi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
	    Chúa cất khỏi ngươi những tai họa ô nhục,
	    Cho đàn chiên tiến bước và được mừng chúc,
	    trên khắp cõi trần thế đây
	    họ sẽ được vinh quang, được chúc phúc, ngợi ca.
    }
  >>
}

loiPhanHai = \lyricmode {
  Reo vui lên hỡi Si -- on
  Đàn hát lên Is -- ra -- el hỡi
  Án phạt ngươi Chúa đã rút lại,
  Quân thù ngươi Chúa đã đẩy lui.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
