% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Phó Thác Cho Chúa"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 4 e8 e |
  d d c c |
  g'4 r8 a |
  a a a4 |
  a g c c |
  b4 r8 c |
  c a a4 |
  c b c d |
  g,4 r8 a |
  a g g8. f16 |
  d8 f g d |
  c2 ~ |
  c4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  \partial 4 e8 e |
  e8. e16 d8 c |
  f4 f8 d |
  e4. c8 |
  c f e d |
  a'2 |
  c8 c b c |
  g4 a8 d, |
  f d b d |
  c2 ~ |
  c4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy sống vô tư và hồn nhiên:
  Phó thác quá khứ cho lòng Chúa xót thương,
  Phó thác hiện tại cho tình yêu của Ngài,
  Phó thác tương lai để bàn tay Chúa quan phòng.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Nếu quá khứ có bao thành tích,
      hãy tạ ơn vì nhờ Chúa luôn trợ giúp.
      Nếu trót vương lỗi lầm,
      hãy tự hối xin Ngài thứ tha.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Hãy nhớ mỗi phút giây cuộc sống
      có bàn tay hiền dịu Chúa thương dìu dắt,
      Khi công thành danh toại chính nhờ Chúa luôn ở với ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Mỗi ước muốn cũng như dự tính có thành không
      ngàn đời Chúa đã định sẵn.
      Tuy con người mưu sự, phúc trời mới cho được viên thành.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
