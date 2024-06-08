% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hiến Lễ Chính Mình"
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
  \key f \major
  \time 2/4
  f8 f a d, |
  g2 ~ |
  g8 g f
  <<
    {
      f |
      bf bf a g |
      c4. c8 |
      d d d d |
      g,4 c,8 c |
      g' g e e |
      f2 ~ |
      f8 \bar "||"
    }
    \notBePhu -2 {
      ef8 |
      d d f f |
      e4. f8 |
      bf a g f |
      e4 e8 e |
      bf' bf g g |
      a2 ~ |
      a8
    }
  >>
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4. a8 a a |
  d,4. c8 |
  c f e e |
  a4. bf8 |
  bf bf bf bf |
  g4. g8 |
  g c e, f |
  f2 ~ |
  f4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Họp mừng lễ Vượt Qua ta cùng Hội Thánh tiến dâng của lễ,
  nhưng nhớ hiến lễ chính mình là của lễ Chúa hằng đợi trông.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hiến lễ chính mình là vượt qua mọi tội lỗi
      biết chết với Chúa mỗi ngày hầu được sống lại vinh quang.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Hiến lễ chính mình là vượt qua điều thèm muốn,
      hãy sống bác ái
      hết mình phục vụ Chúa và anh em.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Hiến lễ chính mình là vượt qua mọi hiềm khích
      hãy thấy rõ hết lỗi mình thành thật cúi đầu xin tha.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Hiến lễ chính mình là vượt qua mọi mộng ước
      Đón lấy ý Chúa sớm chiều nhiệt tình quyết thực thi luôn.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
