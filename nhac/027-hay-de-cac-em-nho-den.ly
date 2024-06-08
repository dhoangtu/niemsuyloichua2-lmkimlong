% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hãy Để Các Em Nhỏ Đến"
  poet = "Ý lời ca: Từ Mt 20, 19-21"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  f, (g) a g |
  e (f) g g |
  c,4 c8 a'16 (g) |
  f8. e16 f8 a |
  g8. a16 g8 c |
  f,4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  f,8. (e16) f8 g |
  d (f) g a |
  g4 c8 f, |
  g4 a8 g16 (f) |
  d8. c16 e8 g |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy để các em nhỏ đến với Thầy
  vì Nước Trời là của những ai giống như chúng vậy.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chúa gặp một em nhỏ đi với mẹ,
      Chúa bảo em bám cho chặt, đòi mua bánh ăn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa gặp một em nhỏ đang dỡn chơi,
      Chúa bảo em cứ nô đùa mà đừng đánh nhau.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chúa gặp một em nhỏ đang kéo co,
      Chúa bảo em kéo cho mạnh mà kìm vững chân.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa gặp một em nhỏ đang đánh bi,
      Chúa bảo em chớ hơn thiệt rồi ghen ghét nhau.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Chúa gặp một em nhỏ đang hát vui
      Chúa bảo em hát cao giọng mà đừng hát sai.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "6."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa gặp một em nhỏ mang sách theo
      Chúa bảo em hãy chăm học, đừng làm biếng nghe.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "7."
      Chúa gặp một em nhỏ đang xướng kinh,
      Chúa bảo em chú tâm vào mà xin Chúa thương.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "8."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa gặp một em nhỏ xem Thánh Kinh,
      Chúa bảo em nhớ kỹ vào từng lời đấy nghe.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "9."
      Chúa gặp một em nhỏ mong lớn mau,
      Chúa bảo em hãy vuông tròn từng việc trước đi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "10."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa gặp một em nhỏ đang nghĩ suy,
      Chúa bảo em hướng tâm hồn về trời sẽ vui.
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
