module ComentsHelper
  def link_previouscoments(_post)
    return "<p class='text-muted'>No comments yet</p>".html_safe if @coments.count.zero?
    return "<p class='text-muted'>Last Page</p>".html_safe if @coments.count < 15

    link_to 'Previous comments..', post_path(id: @post.id, lastcomentdate: @coments.last.created_at),
            class: 'link-dark text-center'
  end

  def firstcomments(coments)
    return '' if coments.count.zero?

    link_to 'Beginning', post_path(id: @post.id, lastcomentdate: nil), class: 'link-dark mx-2'
  end
end
