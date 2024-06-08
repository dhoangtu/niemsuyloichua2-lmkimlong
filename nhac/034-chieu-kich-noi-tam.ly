% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chiều Kích Nội Tâm"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4. f8 e g16 (a) |
  d,8 d16 d a'8 e |
  d d16 d g8 g |
  c, f e (f) |
  g4 c,8 a' |
  a8 f16 f bf8 g |
  c8 bf16 bf bf8 c |
  g4. f8 |
  bf8. g16 g8 a |
  a4. e16 e |
  a8 e c c |
  f2 ~ |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  f g e a |
  a8. e16 e (f) g8 |
  d4. c8 |
  c8. a'16 a8 a |
  e4 d8 d |
  bf' e, g16 g g8 |
  f2 ~ |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Trong một xã hội mà chủ nghĩa tiêu thụ
  và chủ nghĩa khoái lạc đang tràn lan
  Người tín hữu cần nhận thức Hội Thánh là một đoàn lữ hành
  tìm kiếm thành trì tương lai
  bằng chiều kích chiệm niệm nội tâm.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Người vui sống đời thánh hiến từ bỏ chính mình
      và người sống giữa xã hội cần hợp tác và giúp đỡ lẫn nhau.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Thời nay có nhiều thách đó và những dỗ dành,
      đòi người đáp tiếng Chúa gọi
      cần hiệp nhất mật thiết với Chúa luôn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Mọi nơi bao người chống đối,
      miệt thị đố kỵ.
      Cẩn thận nắm vững huấn lệnh,
      và Lời Chúa là ánh sáng chiếu soi.
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
