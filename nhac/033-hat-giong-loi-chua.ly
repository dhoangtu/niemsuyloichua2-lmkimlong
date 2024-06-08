% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hạt Giống Lời Chúa"
  poet = "Ý lời ca: 1Pr 1, 22-25"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  e8 e d f |
  e4. d8 |
  d c f e |
  a4. a8 |
  a g c c |
  b8. b16 b8 d |
  e4. a,8 |
  d2 |
  g,8 g4 d'8 |
  c2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  c8 e d g |
  a2 |
  c8 c b c |
  g4. g16 (a) |
  fs8 g e f! |
  d4. d8 |
  g e d b |
  c2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Anh em được tái sinh không do hạt giống mục nát
  nhưng do hạt giống bất diệt là lời Thiên Chúa hằng sống
  tồn tại muôn đời.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Nhờ tuân phục chân lý anh em được thanh luyện
      để thực thi tình huynh đệ
      vậy hãy yêu nhau thực tâm.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Tựa như cỏ mau héo
      nhân gian đều suy tàn
      Chỉ Lời Chúa là vĩnh hằng, bền vững qua muôn ngàn năm.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Lời Chúa được loan báo vang danh là Tin Mừng
      để phàm nhân được cứu độ
      vậy hãy lưu tâm niệm suy.
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
    \override Lyrics.LyricSpace.minimum-distance = #3
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
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
