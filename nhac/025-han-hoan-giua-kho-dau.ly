% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hân Hoan Giữa Khổ Đau"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

notBePhu =
#(define-music-function (font-size music) (number? ly:music?)
   (for-some-music
     (lambda (m)
       (if (music-is-of-type? m 'rhythmic-event)
           (begin
             (set! (ly:music-property m 'tweaks)
                   (cons `(font-size . ,font-size)
                         (ly:music-property m 'tweaks)))
             #t)
           #f))
     music)
   music)

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  e8 e f d |
  g2 |
  g8 g e c' |
  b8. b16 b8 d |
  g,4. f8 |
  f g a d, |
  d8. d16 d8 g |
  c,4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  \partial 4 e8 f |
  f8. d16 a'8 g |
  g8. e16 c'8 a |
  d2 |
  c8 e c d |
  d8. e16 a, (g) a8 |
  g g g c |
  c2 ~ |
  c4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hân hoan giữa khổ đau cho hy vọng sáng lên hòa bình ló rạng
  mọi người tay bắt mặt mừng thật là nghĩa tình.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Khi có Chúa lòng sẽ an vui tầm mắt mở ra
      Nhận biết một Cha chung, tất cả mọi người đều là anh em.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Xin Chúa đến hiệp nhất muôn dân bằng chính niềm tin
      Và xóa mờ đau thương chiếu tỏ rạng ngời một trời an vui.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Bao ác ý và những âm mưu biệt tích ngàn phương
      Nhân ái và yêu thương sẽ nở hoa đẹp mầu và thơm hương.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Ân phúc Chúa mờ xúa thương đau ở khắp mọi nơi,
      Đem thái bình an vui khiến cả gian trần họp mừng khôn ngơi.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
