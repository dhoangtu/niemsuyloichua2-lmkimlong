% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Ta Không Cô Đơn"
  poet = \markup \left-column {
    "Ý lời ca: Từ một bài huấn giáo"
    "của Đức Phanxicô"
  }
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4. f8 f f |
  f4 d8 e |
  e d d16 (e) c8 |
  g'4 g8 g |
  a4 bf8 bf |
  a4 bf8 bf |
  c e, g16 (a) c,8 |
  f2 ~ |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  f16 (a) g8 d d |
  c4. f8 |
  f e16 (f) d8 d |
  g4. g8 |
  a e e g |
  c,4 r8 c |
  c f f f |
  d8. bf'16 g8 bf |
  c2 ~ |
  c8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ta không cô đơn, nhưng có Chúa luôn ở cùng ta:
  Cha nhân ái, Cha trên trời luôn thương mến và ở gần ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hình ảnh cha mẹ gian trần cho ta cảm nghiệm tình thương
      nhưng giới hạn và bất toàn.
      Còn tình yêu Cha trên trời mãnh liệt kiên vững.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Hình ảnh ân tình phu phụ cho ta hiểu được tình yêu
      nhưng cách biệt thường hững hờ.
      Còn tình yêu Cha trên trời không bờ không bến.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Mẹ nhẫn tâm quên con mình chính nó mang nặng đẻ đau,
      Ta cũng không hề khi nào đành lòng quên con
      khi lòng vẫn hằng ưu ái.
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
    \override Lyrics.LyricSpace.minimum-distance = #1
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
