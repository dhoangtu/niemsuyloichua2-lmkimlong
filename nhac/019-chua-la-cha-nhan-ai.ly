% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Là Cha Nhân Ái"
  poet = "Ý lời ca: Mt 7, 32"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f8 e f a |
  d,4. e8 |
  e f f d |
  c4. f8 |
  f g e g |
  a4 a8 a |
  a f g a |
  bf4. bf8 |
  bf c g e |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  e e f g |
  d4. c8 |
  c a' f
  <<
    {
      \voiceOne
      bf
    }
    \new Voice = "splitpart" {
      \voiceTwo
      \once \override NoteColumn.force-hshift = #-2.5
      \tweak font-size #-2
      \parenthesize
      a
    }
  >>
  \oneVoice
  bf4 r8 a |
  g g d' b! |
  c4. c8 |
  a c a16 (g) e8 |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Khi điều ta khấn cầu sao chưa thấy Chúa nhậm lời,
  nên ta thất vọng chê chán.
  Hãy nhớ Chúa là Cha nhân ái luôn săn sóc bang trợ ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Có thực điều ta khấn cầu là cần gấp là hữu ích,
      hay còn điều quý trọng hơn Chúa đang muốn trao tặng ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Có một người cha tốt nào lại từ chối lời
      \markup { \underline "con" } cái, nhưng tìm điều tốt,
      điều hay khiến con sướng vui thỏa thuê.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chúa từng cầu xin nếu được thì khỏi uống cạn chén đắng,
      nhưng đừng tùy ý của Con, nhưng theo ý Cha mà thôi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Cứ nhiệt tình xin sẽ được,
      tìm hoài ắt là sẽ thấy,
      kiên trì mà gõ cửa đi mãi cho tới khi mở ra.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
