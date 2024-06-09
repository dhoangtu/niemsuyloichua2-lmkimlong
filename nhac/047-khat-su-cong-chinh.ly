% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = \markup \center-column {
    "Khát Sự Công Chính"
    \huge "(mối phúc thứ tư)"
  }
  poet = \markup \left-column {
    "Ý lời ca: Từ một bài giảng Giáo lý"
    "của Đức Phanxicô"
  }
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8 b8 |
  g a b b |
  fs4. fs8 |
  g g g e |
  b'4. g16 g |
  g8 b e, g |
  a4. g8 |
  <<
    {
      c8 c a c |
      d2 \bar "|."
    }
    {
      f,!8 e g g |
      fs2
    }
  >>
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  b8 b g b |
  c4. a8 |
  a8. d16 fs,16 (g) b8 |
  a4. fs8 |
  fs e fs16 (g) a8 |
  d,8. d16 fs8 (g) |
  a4. a16 a |
  a8 a g a |
  b2 ~ |
  b4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Có một cơn khát dữ dội hơn đói khát bánh và nước
  mà người người khắc khoải đợi trông là đói khát sự công chính.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Áp bức tràn đây đó kỳ thị đối xử bất công,
      bao nhiêu người bị bóc lột, bị bỏ rơi
      đang nao nao trông chờ công lý.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chính Chúa là chân lý, là đường dẫn về phúc vinh,
      Bao lâu còn chẳng kiếm tìm và cậy tin
      Tâm tư luôn luôn còn khao khát.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ta đây được Thiên Chúa tạo dựng chính bởi Chúa thôi
      Khi chưa về ở với Ngày mà nghỉ ngơi
      Con tim chưa bưa và thao thức.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi chưa nhận ra Chúa, chưa tuân giữ lời Thánh Kinh,
      Chưa nghe lời của Thánh Thần và thực thi,
      sao dương gian qua được cơn khát.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.9
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
    \override Lyrics.LyricSpace.minimum-distance = #1.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
