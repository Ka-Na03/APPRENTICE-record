# シンボル
# シンボルについて文字列との違いとシンボルの用途を簡潔に説明
# シンボルは変更不可のオブジェクトで文字列は変更可能である
# メモリ使用量がシンボルの方が少ない、文字列は作成するたびに新しいオブジェクトになるため
# 文字列はテキストデータを表現する時に使用する
# シンボルは識別子や値を表現するときに使用するキーで使用する際は後ろにつける
# キーで使用する際にシンボルは省略できて便利だが日本語や特殊文字を使用する場合は文字列で使用する

def conversion_rates(amount, source_currency, target_currency, conversion_rates)
    return amount if source_currency == target_currency

    conversion_rate = conversion_rates{source_currency}
    conversion_amount = amount * conversion_rate