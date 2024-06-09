% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hãy Nên Trọn Lành"
  poet = "Ý lời ca: Từ Mt 5, 43-48"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4. f8 e d |
  c4 g'8 f |
  f bf bf bf |
  a a d g, |
  g2 ~ |
  g8 g f e |
  d d16 (e) c8 c |
  f2 ~ |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  e d c f |
  f f e4 ~ |
  e8 f e d |
  g2 |
  bf8
  <<
    {
      \voiceOne
      \once \stemDown bf8
    }
    \new Voice = "splitpart" {
      \voiceTwo
      \once \override NoteColumn.force-hshift = #-1.5
      \tweak font-size #-2
      \parenthesize
      d8
    }
  >>
  \oneVoice
  d8 g, |
  g4. g8 |
  e (d) c f |
  f2 ~ |
  f8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy nên trọn lành,
  nên trọn lành như Cha trên trời là Đấng trọn lành,
  Hãy nên trọn lành mỗi ngày một hơn.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Muốn nên trọn lành như Cha trên trời
      hãy mở lòng ra yêu thương hết mọi người,
      tất cả là anh em.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Muốn nên trọn lành như Cha trên trời
      đã dủ tình thương cho mưa nắng đượm nhuần
      tất cả nhận như nhau.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Muốn nên trọn lành như Cha trên trời
      chẳng phân biệt chi kẻ \markup { \underline "dữ" }
      với người lành
      tất cả cùng bên nhau.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Muốn nên trọn lành như Cha trên trời
      Hãy luôn cầu xin cho ai bách hại mình,
      tất cả đều thi ân.
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
