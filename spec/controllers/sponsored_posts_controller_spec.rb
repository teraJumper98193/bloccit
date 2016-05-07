require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  # #12
    let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  # #13
    let(:my_sponsoredpost) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }



  # #1
  describe "GET new" do
     it "returns http success" do
# #18
       get :new, topic_id: my_topic.id
       expect(response).to have_http_status(:success)
     end

     # #2
          it "renders the #new view" do
    # #19
            get :new, topic_id: my_topic.id
            expect(response).to render_template :new
          end

     # #3
          it "instantiates @SponsoredPost" do
    # #20
            get :new, topic_id: my_topic.id
            expect(assigns(:SponsoredPost)).not_to be_nil
          end
        end

        describe "SponsoredPost create" do

          it "increases the number of Post by 1" do
  # #21
            expect{post :create, topic_id: my_topic.id, SponsoredPost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(SponsoredPost,:count).by(1)
          end


          it "assigns the new post to @SponsoredPost" do
  # #22
            post :create, topic_id: my_topic.id, SponsoredPost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
            expect(assigns(:SponsoredPost)).to eq SponsoredPost.last
          end


          it "redirects to the new SponsoredPost" do
  # #23
            post :create, topic_id: my_topic.id, SponsoredPost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
  # #24
            expect(response).to redirect_to [my_topic, SponsoredPost.last]

          end
        end

    describe "GET show" do
    it "returns http success" do
# #15
    get :show, topic_id: my_topic.id, id: my_post.id
    expect(response).to have_http_status(:success)
  end
  it "renders the #show view" do
# #16
    get :show, topic_id: my_topic.id, id: my_post.id
    expect(response).to render_template :show
  end

    it "assigns my_sponsoredpost to @SponsoredPost" do
# #17
    get :show, topic_id: my_topic.id, id: my_post.id
    expect(assigns(:SponsoredPost)).to eq(my_post)
  end
end

describe "GET edit" do
  it "returns http success" do
# #25
    get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
    expect(response).to have_http_status(:success)
  end

  it "renders the #edit view" do
# #26
    get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
    expect(response).to render_template :edit
  end


  it "assigns post to be updated to @SponsoredPost" do
# #27
    get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
    post_instance = assigns(:SponsoredPost)

    expect(SponsoredPost_instance.id).to eq my_sponsoredpost.id
    expect(SponsoredPost_instance.title).to eq my_sponsoredpost.title
    expect(SponsoredPost_instance.body).to eq my_sponsoredpost.body
  end
end

describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
# #28
      put :update, topic_id: my_topic.id, id: my_sponsoredpost.id, SponsoredPost: {title: new_title, body: new_body}


      updated_post = assigns(:SponsoredPost)
      expect(updated_sponsoredpost.id).to eq my_sponsoredpost.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
    end

    it "redirects to the updated SponsoredPost" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

# #29
      put :update, topic_id: my_topic.id, id: my_sponsoredpost.id, SponsoredPost: {title: new_title, body: new_body}
# #30
      expect(response).to redirect_to [my_topic, my_sponsoredpost]
    end
  end

describe "DELETE destroy" do
  it "deletes the post" do
# #31
    delete :destroy, topic_id: my_topic.id, id: my_sponsoredpost.id
    count = SponsoredPost.where({id: my_sponsoredpost.id}).size
    expect(count).to eq 0
  end

  it "redirects to topic show" do
# #32
  delete :destroy, topic_id: my_topic.id, id: my_sponsoredpost.id
# #33
  expect(response).to redirect_to my_topic
    end
  end
end
