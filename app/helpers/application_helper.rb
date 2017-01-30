module ApplicationHelper
  def default_meta_tags
    {
      site: "ハルカラ！【春から立教】",
      title: "ハルカラ！【春から立教】",
      description: "あなたもハルカラ！で最高の立教生活を送りませんか？登録者続々！登録は簡単で、すぐに春から立教の新入生に出会えます！",
      canonical: request.original_url,
      og: {
        title: :title,
        type: "website",
        url: request.original_url,
        image: image_url("og.png"),
        site_name: :site,
        description: :description,
        locale: 'ja_JP'
      },
      twitter: {
        title: :title,
        site: '@kent_ear',
        card: 'summary',
        description: :description,
        image: image_url("og.png"),
        url: :url
      }
    }
  end
end
