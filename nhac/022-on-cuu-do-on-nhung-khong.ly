% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Ơn Cứu Độ - Ơn Nhưng Không"
  poet = "Ý lời ca: Từ một bài giảng của Đức Phanxicô"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 a |
  d,8. d16 g8 g |
  g4. f8 |
  bf bf a16 (bf) g8 |
  c4. bf8 |
  bf d g, g |
  c4. g8 |
  g a d, d |
  d4 d8 d |
  c e g g |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 e e e |
  g8. a16 g8 g16 (f) |
  d8 e c c |
  g'4 r8 bf |
  bf a16 (bf) g8 g |
  a8. g16 f (a) g (f) |
  c8 g'16 g g8 e |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ơn cứu độ là ơn nhưng không
  là sáng kiến của tình yêu.
  Không do giữ luật mà có, không do đã làm việc lành
  nhưng do lòng yêu mến Chúa thôi.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Thay vì phạt tội ta
      Chúa sai Con Một xuống chuộc tội ta,
      Lấy máu rửa sạch tội nhơ
      khai mở con đường dẫn đến cõi trường sinh.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ta được nhận là con, dẫu không công nghiệp,
      không tài lực chi,
      Sẽ lãnh sản nghiệp đời sau
      nhưng chỉ do lòng Chúa ái tuất mà thôi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Khi cùng được hiệp thông với muôn muôn người khắp cả trần gian
      Lãnh ơn cứu độ, ta hãy chăm chỉ
      khẩn câu Chúa giáng phúc bình an.
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
