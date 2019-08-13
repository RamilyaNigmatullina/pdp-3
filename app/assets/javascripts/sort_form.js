POSTS_PAGE_SELECTOR = ".posts-page";
SORT_FORM_SELECTOR = ".sort-form";
SORT_ORDER_INPUT_SELECTOR = "#sort_form_order";


class SortForm {
  constructor(postsPageSelector) {
    this.form = $(formSelector);
    this.form = $(SORT_FORM_SELECTOR);
    this.orderInput = $(SORT_ORDER_INPUT_SELECTOR, this.formSelector)[0];

    this.bindEvent();
  }

  bindEvent() {
    this.orderInput.addEventListener("change", () => this.sortPosts());
  }

  sortPosts() {
    $.ajax({
      url: this.form.attr("action"),
      type: "GET",
      dataType: "json",
      data: {
        sort_order: this.orderInput[this.orderInput.selectedIndex].value,
        search:
        page:
      }
    }).done(function(response) {
      $(".posts").html(JST["templates/post"]({posts: response}));
    })
  }
}

new SortForm(POSTS_PAGE_SELECTOR);
