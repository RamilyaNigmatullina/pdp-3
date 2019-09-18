SEARCH_FORM_SELECTOR = ".js-search-form";
ORDER_INPUT_SELECTOR = ".js-order-input";
TAGS_INPUT_SELECTOR = ".js-tags-input";
POSTS_CONTAINER_SELECTOR = ".js-posts-container";
LOAD_MORE_LINK_SELECTOR = ".js-load-more-link";
ITEMS_PER_PAGE = 5;
DEFAULT_PAGE = 1;

class SearchForm {
  constructor(formSelector) {
    this.form = $(formSelector);
    this.orderInput = $(ORDER_INPUT_SELECTOR, this.formSelector)[0];
    this.tagsInput = $(TAGS_INPUT_SELECTOR, this.formSelector)[0];
    this.loadMoreLink = $(LOAD_MORE_LINK_SELECTOR)[0];
    this.postsContainer = $(POSTS_CONTAINER_SELECTOR);
    this.page = DEFAULT_PAGE;

    this.bindEvent();
    this.loadPosts();
  }

  bindEvent() {
    this.loadMoreLink.addEventListener("click", this.loadMore.bind(this));
    this.orderInput.addEventListener("change", this.updatePosts.bind(this));
    this.tagsInput.addEventListener("input", $.debounce(this.updatePosts.bind(this), 300));
  }

  updatePosts() {
    this.page = DEFAULT_PAGE;
    this.loadPosts();
  }

  loadMore() {
    event.preventDefault();
    this.page += 1;
    this.loadPosts();
  }

  loadPosts() {
    $.ajax({
      url: this.form.attr("action"),
      type: "GET",
      dataType: "json",
      data: {
        page: this.page,
        search_form: {
          order: this.orderInput[this.orderInput.selectedIndex].value,
          tags: this.tagsInput.value
        }
      },
      success: function(response) {
        this.toggleLoadMoreLink(response);
        this.showPosts(response);
      }.bind(this)
    });
  }

  toggleLoadMoreLink(response) {
    $(this.loadMoreLink).toggleClass("hidden", response.length != ITEMS_PER_PAGE)
  }

  showPosts(response) {
    var html = JST["templates/post"]({posts: response});
    this.page == DEFAULT_PAGE ? this.postsContainer.html(html) : this.postsContainer.append(html)
  }
}

if ($(SEARCH_FORM_SELECTOR).length > 0) {
  new SearchForm(SEARCH_FORM_SELECTOR);
}
