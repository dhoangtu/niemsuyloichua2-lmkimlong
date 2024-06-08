% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Hiển Dung"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 f |
  f e g
  <<
    {
      a |
      a4 a8 f |
      g4 bf8 bf |
      d d c a |
      a4. a8 |
      f a bf bf |
      g4 r8
    }
    {
      g8 |
      f4 f8 d |
      e4 d8 d |
      bf' bf a e |
      f4. f8 |
      d f g f |
      e4 r8
    }
  >>
  g8 |
  g g e16 (d) g8 |
  c,4 c8 c |
  <<
    {
      e8 g g e |
      f2 ~ |
      f4 r \bar "|."
    }
    {
      c8 bf b! c |
      a2 ~ |
      a4 r
    }
  >>
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  a8 a a f |
  g4. bf8 |
  bf bf bf a |
  g2 |
  bf8 bf c c |
  d4. d8 |
  g, c a (g) |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Đem ba môn đệ lên núi vắng, Chúa hiển dung:
  Mặt Ngài sáng chói như mặt trời,
  áo Ngài như tuyết trắng tinh.
  Có tiếng Chúa Cha phán rằng:
  Này là Con Chí ái của Ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Muốn thấy Chúa hiển dung hãy cứ tiến bước lên cao,
      Tìm vào nơi thanh vắng sẽ hưởng kiến tỏ tường.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Muốn Chúa đến cùng ta, hãy cố gắng lắng tai nghe,
      Thực hành như tuyên phán: Chúa trìu mến vi hành.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Nếu có Chúa ngự đây
      Sẽ thấy thích thú hân hoan
      Và thầm mong sao Chúa cứ ngự đến muôn đời.
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
