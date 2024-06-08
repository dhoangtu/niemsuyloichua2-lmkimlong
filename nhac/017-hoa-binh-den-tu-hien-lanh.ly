% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hòa Bình Đến Từ Hiền Lành"
  poet = "Ý lời ca: Từ một bài suy niệm của Đức Phanxicô"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4 c8 b |
  b d c g |
  g4. g8 |
  e e e (g) |
  a4 c8 b |
  b d16 (e) c8 g |
  g4. g8 |
  d d f (g) |
  c,2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  e8 c f e |
  e4. a8 |
  b c4 a8 |
  g4 f8 f |
  f f a a |
  d4. a8 |
  b a16 (b) g8 c |
  c4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Muôn người cùng ước mong hòa bình,
  nhưng hòa bình chỉ có
  Khi người người sống vui hiền lành
  khiêm nhường và nhẫn nhịn.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Xáo trộn khắp nơi nơi làm chinh chiến lan tràn,
      mọi thỏa hiệp chỉ có giá trị khi biết nhẫn nhịn yêu thương.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Từng người hãy suy tư nào ta có thành toàn,
      vậy gặp người nào lỡ lỗi lầm
      luôn hãy nhẫn nhịn khoan dung.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Song hành với địch thù hãy mua mắn lo liệu
      Đừng còn đợi chờ đến cuối đường e khó thỏa hiệp xong xuôi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Muôn người khắp nơi nơi cùng vui sống khiêm nhường,
      và hiền lành và cố nhẫn nhịn tan biến khổ sầu đua tranh.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.7
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
