% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Khát Hay Ta Khát"
  poet = "Ý loời ca: Ga 4, 7-15"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 8 c8 |
  c4 g8 g |
  a4 r8 g |
  e c f f |
  f8. e16 f8 e |
  d4. c8 |
  f f f d |
  g4.
  <<
    {
      a8 |
      g g
    }
    {
      f8 |
      e e
    }
  >>
  <<
    {
      \voiceOne
      d'16 _(e) d8
    }

    \new Voice = "splitpart" {
      \voiceTwo
      f,8 g
    }
  >>
  \oneVoice
  <c e, c>2 ~ |
  <c e, c>4 r \bar "|."
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  g8 g f e |
  d4. d8 |
  c c c c |
  f4. e8 |
  a4. g8 |
  c b16 (c) a8 e |
  e8 r8 d r |
  r b' e e, |
  a4 g8 g |
  c4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa khát hay ta khát.
  Chúa xin một chút nước giếng
  nhưng muốn trao ban một thứ nước sẽ vọt lên
  đem lại sự sống muôn đời.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Mang thân phận con người sau hành trình dài mệt mỏi,
      Ngài khát, Ngài khát chỉ một chút nước?
      Không, Ngài khát vầng tim rộn cảm mến.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa khát những con người tay Ngài đà từng tạo tác,
      rầy đã lạc bước mải mê kiếm sống.
      Sao lại khát lợi danh và quyền uy.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chúa khát những tâm hồn đêm ngày rạo rực
      thèm khát gặp gỡ và luôn mở lòng đón Chúa.
      Vâng, lạy Chúa này con cần Ngài liên.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Bao nhiêu cảnh tương tàn, bao người vật vờ vì đói,
      vì khát thèm chia nghĩa tình gắn kết
      Ai? Ai lấy tình yêu mà tặng ban?
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
