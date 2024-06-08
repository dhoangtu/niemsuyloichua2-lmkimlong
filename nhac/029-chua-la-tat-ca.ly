% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Là Tất Cả"
  poet = \markup \left-column {
    "Ý lời ca: Từ một câu của Tagore"
    "+ Tv 126"
  }
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  g f e16 (f) d8 |
  d4. d16 (e) |
  c8 f e g |
  a4 r8 a |
  a bf a16 (bf) g8 |
  c4. bf8 |
  d d bf d |
  \grace { g,16 (a } g4.) a8 |
  f f a d, |
  g4. e8 |
  e e f d |
  d4 d8 e |
  c c g' e |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 e f d |
  g4. f8 |
  bf g g bf |
  c4 r8 c |
  d4. c8 |
  bf f f g |
  a4. c,8 |
  c g' g f |
  f2 ~ |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Tôi ước mong chẳng còn gì chỉ còn duy một Thiên Chúa.
  Tôi mong ước chẳng còn chi, nhờ đó Chúa là tất cả
  thấy Ngài ở khắp mọi nơi, tìm gặp Ngài trong mọi sự,
  yêu mến Ngài từng phút từng giây.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Tôi càng lu mở đi thì Chúa càng trổi vượt lên.
      Tôi sống, nhưng chẳng còn là tôi sống
      mà là Chúa sống trong tôi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Mưu sự tại nhân, mà nếu thành sự tại Chúa.
      Không Chúa ta chẳng làm được chi hết,
      miệt mài cũng luống công thôi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ta chỉ gieo hạt thôi, mầm sống mọc là ở Chúa,
      Vun tưới cây chỉ rợ cành xanh lá,
      Nhờ Ngài kết trái khai hoa.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi Ngài không dựng xây, thợ sẽ cực nhọc vô ích.
      Khi Chúa chẳng thương nhìn
      thành trông giữu tuần hành thức trắng như không.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.45
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
