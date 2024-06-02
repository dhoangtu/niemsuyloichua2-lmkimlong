% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Lên Tiếng Ngợi Ca"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 e |
  a8. a16 d,8 g |
  g4. a8 |
  bf8. a16 g8 g |
  c2 |
  c8 c16 (d) bf8 bf16 (c) |
  a8. a16 a8 a |
  c4. f,8 |
  g e f d |
  c8. c16 g'8 g |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 f e a |
  d,2 |
  e8 e d g |
  c,4. c8 |
  c c f d |
  g4. f8 |
  g g g e |
  a2 |
  a16 (bf) a8 g c |
  f,4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Khi nhìn ngắm vũ trụ bao la,
  chiêm ngưỡng muôn vàn kỳ công,
  bao vẻ đẹp diễm lệ sao không lên tiếng ngợi ca
  bàn tay uy quyền của Đấng Tác sinh.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Bao nhiêu là dấu lạ, bao nhiêu việc lẫy lừng
      Ngài thực hiện trong đời ta,
      Tại sao ta không nhận biết để dâng lời cám tạ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Bao nhiêu là phúc lộc,
      Khi không bị ngã bệnh, từng ngày được sống bình an,
      Tại sao ta không nhận biết để dâng lời cám tạ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Bao thân bằng quyến thuộc bên nhau thật nghĩa tình,
      nhịp nhàng dìu nhau nhịp bước
      Tại sao ta không nhận biết để dâng lời cám tạ.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
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
