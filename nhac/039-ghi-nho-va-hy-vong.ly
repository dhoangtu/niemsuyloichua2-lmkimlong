% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Ghi Nhớ Và Hy Vọng"
  poet = \markup \left-column {
    "Ý lời ca: Từ một bài suy niệm"
    "của Đức Phanxicô"
  }
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  a8 a g fs |
  fs4. fs8 |
  fs fs fs a |
  e4 c'8 b |
  b d b c |
  a4. c8 |
  d fs, a fs16 (a) |
  g4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8 a8 |
  a a fs
  <<
    {
      \voiceOne
      a
    }
    \new Voice = "splitpart" {
      \voiceTwo
      \once \override NoteColumn.force-hshift = #2
      \tweak font-size #-2
      \parenthesize
      g8
    }
  >>
  \oneVoice
  g4. b8 |
  b b g c |
  c4. e8 |
  d e a, c |
  b2 |
  b8 b c b |
  a4. a8 |
  a a d, a' |
  g2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ta không thể hoàn thành cuộc hành trình về Nước Trời
  Nếu không ghi nhớ và hy vọng
  không chấp nhận những hiểm nguy.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Nhắc nhớ những ngày tháng qua có ánh sáng và bóng tối,
      có vui sướng và khổ đau,
      Nhưng tay Chúa yêu thương vẫn dẫn dắt từng bước đi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Hãy hướng mắt về
      \markup { \underline "tương" } lai:
      những lối bước ngợp ánh sáng, những mong ước đẹp biết bao
      Xin ơn Chúa nương theo mãi dẫn dắt trợ giúp cho.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Dẫu quá khứ hoặc
      \markup { \underline "tương" } lai những thách thức hằng dõi bước
      Nếu không sẵn sàng lướt qua,
      Không tin Chúa yêu thương sẽ thối chí và tháo lui.
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
