% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Đang Ở Đâu"
  composer = "Lm. Kim Long"
  poet = "Ý lời ca: Từ một câu Tv 42"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4. c8 b g |
  a4. a8 |
  a a a a |
  f4 e8 b' |
  b4. a8 |
  c d b g |
  a4 \bar "||"
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4 
  <<
    {
      e8 e |
      c4 d8 d |
      b4 r8 b |
      c b a g |
      a4 r8
    }
    {
      gs8 gs |
      a4 fs8 fs |
      g4 r8 gs |
      a e f e |
      a,4 r8
    }
  >>
  <a' f d>8 |
  <a e c> \bar "|."
}

% Lời
loiPhanMot = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chúa đang ở đâu khi con cô đơn đau khổ
      và quanh con sự dữ vẫn luôn tràn lan?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
	    Chúa đang ở đâu khi con băn khoăn trăn trở
	    vì tim con thổn thức biết bao ngày đêm?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
	    Chúa đang ở đâu khi anh em con căm giận
	    và âm mưu tàn sát lẫn nhau nào ngơi?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
	    Chúa đang ở đâu nơi nơi tan hoang binh lửa,
	    người di cư nào biết ẩn thân vào đâu?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
	    Chúa đang ở đâu bao đôi uyên ương dang dở
	    và thai nhi nào thấy ánh dương rạng soi?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "6."
      \override Lyrics.LyricText.font-shape = #'italic
	    Chúa đang ở đâu âm mưu, gian tham vây bủa
	    làm tương lai mộng ước sẽ đi về đâu?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "7."
	    Chúa đang ở đâu khi chư dân luôn tra hỏi,
	    Từ thương đau nào biết sẽ thưa làm sao?
    }
  >>
}

loiPhanHai = \lyricmode {
  Hãy vững tin, hãy vững tin,
  Ta vẫn luôn ở bên con, con ơi.
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
  page-count = 1
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
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
