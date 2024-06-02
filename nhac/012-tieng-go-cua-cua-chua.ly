% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Tiếng Gõ Cửa Của Chúa"
  poet = "Ý lời ca: Kh 3, 20"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 b8 g |
  a4 b8 b |
  g4. fs8 |
  b4 b8 b |
  b g16 (b) a8 e |
  e4. e8 |
  fs4 c8 a' |
  g2 ~ |
  g4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8 g8 |
  fs g g e |
  a4 r8 a |
  b4 g8 g |
  fs4 g8 g |
  g8. g16 e8 e |
  \grace a16 (b4) r8 b |
  d a a fs |
  g4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy nhận ra tiếng gõ cửa của Chúa,
  Chúa muốn nhắc nhở ta điều gì, hay muốn vào với ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Bây giờ ta đang ở đâu,
      Đang nóng hay đang lạnh,
      Đang cheo leo trên bờ vực thẳm?
      Có cần Chúa hỗ trợ không?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Trong lòng vui hay sầu đắng
      Vinh thắng hay thảm bại?
      Đang say sưa thân tình cùng Chúa,
      thản hoặc lỡ đã lìa xa?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ta từng cam đoan cùng Chúa
      Luôn bước theo bên Ngài,
      Hay tin theo bao lời dụ dỗ đã tìm kiếm chút lợi danh?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Bên ngoài sương đêm lạnh lẽo
      Nên Chúa xin mở lòng, xin đi vô chung bàn dùng bữa,
      có còn trống chỗ nào không?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Tâm hồn ta như đền thánh
      Quang sáng cả trong ngoài,
      Mau chăm lo chong đèn rạng rỡ
      sẵn sàng đón Chúa ngự đi!
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
