% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Nước Đem Lại Sự Sống"
  poet = "Ý lời ca: Từ Ga 4, 5-14"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 8 e16 (f) |
  d8 g g g |
  a4 d16 (e) c8 |
  g4. e16 (
  <<
    {
      f) |
      e8 g g a |
      a4. a8 |
      g g
    }
    {
      d16) |
      c8 e e f |
      f4. f8 |
      e e
    }
  >>
  <<
    {
      \voiceOne
      d'16 (e) d8
    }

    \new Voice = "splitpart" {
      \voiceTwo
      f,8 g
    }
  >>
  \oneVoice
  <<
    {
      c2 ~ |
      c4 \bar "|."
    }
    {
      e,2 ~ |
      e4
    }
  >>
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  \partial 4 e8 f |
  f4. f8 |
  f f e d |
  g2 ~ |
  g4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Nếu nhận ra ơn Thiên Chúa hãy nguyện xin
  để Ngài ban cho thứ nước đem lại sự sống muôn đời.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ta khát Chúa, Chúa cũng khát linh hồn ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Do nước ấy nếu uống sẽ không còn khát.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Đây Chúa nói tới Chúa Thánh Linh thần thiêng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Đây suối nước, nếu khát đến mua mà uống.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Ai đuối sức bởi đã trĩu vai gồng gánh.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "6."
      \override Lyrics.LyricText.font-shape = #'italic
      Mau hãy đến Chúa giúp nghỉ ngơi bồi dưỡng.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
