% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Ngỏ Lời Với Từng Ngươi"
  poet = "Ý lời ca: Từ Tv 39"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 a8 |
  f e a d, |
  d4. d8 |
  c c e (f) |
  g f f (g) |
  a4 r8 g |
  c4 e,8 f |
  f2 ~ |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8
  <<
    {
      \voiceOne
      f8
    }
    \new Voice = "splitpart" {
      \voiceTwo
      \once \override NoteColumn.force-hshift = #-2.5
      \tweak font-size #-2
      \parenthesize
      f16
      \tweak font-size #-2
      \parenthesize
      f
    }
  >>
  \oneVoice
  f8 e a d, |
  d4. d8 |
  d c f g |
  g e f (g) |
  a4 r8 a16 bf |
  bf8 g c e, |
  f2 ~ |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa ngỏ lời với từng người,
  kêu gọi và đợi trông lời trả đáp:
  ''Lạy Chúa này con đây''.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      A -- đam vì đã phạm tội
      nên khi vừa nghe tiếng Chúa liền ẩn náu.
      Ta có trốn khi Chúa gọi không?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      \markup { \underline "Ab - bra" } -- ham được Chúa truyền dạy  mau lên đường
      không toan tính mà cậy trông.
      Cứ tiến tới miền đất mù xa.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      \markup { \underline "Sa - mu" } -- en ngủ đã vùng dậy xin thưa thầy:
      Dạ con đây, thầy dạy dỗ.
      Chúa cất tiếng và phán dạy ông.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      \markup { \underline "Ma - ri" }  -- a được sứ thần truyền:
      Mang thai, hạ sinh Con Chúa,
      thật bỡ ngỡ,
      Nhưng tín thác và đáp trả ''Vâng''.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Bao Tông Đồ đã lần lượt khi nghe gọi vội đi theo,
      nào hiểu thấu.
      Nhưng sống chết bên Chúa nào ngơi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "6."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi ta được Chúa gọi mời ''xin vâng''
      và nguyện luôn trung thành cùng Chúa,
      Nhưng có phút nào hững hờ không?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "7."
      Trông lên nhìn Núi Sọ kia:
      Đây Con Một Cha chí ái thật thảm thương.
      Xinh lãnh uống cạn chén khổ đau.
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
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
