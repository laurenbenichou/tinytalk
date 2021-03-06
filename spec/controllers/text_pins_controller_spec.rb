require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TextPinsController do

  # This should return the minimal set of attributes required to create a valid
  # TextPin. As you add validations to TextPin, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TextPinsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all text_pins as @text_pins" do
      text_pin = TextPin.create! valid_attributes
      get :index, {}, valid_session
      assigns(:text_pins).should eq([text_pin])
    end
  end

  describe "GET show" do
    it "assigns the requested text_pin as @text_pin" do
      text_pin = TextPin.create! valid_attributes
      get :show, {:id => text_pin.to_param}, valid_session
      assigns(:text_pin).should eq(text_pin)
    end
  end

  describe "GET new" do
    it "assigns a new text_pin as @text_pin" do
      get :new, {}, valid_session
      assigns(:text_pin).should be_a_new(TextPin)
    end
  end

  describe "GET edit" do
    it "assigns the requested text_pin as @text_pin" do
      text_pin = TextPin.create! valid_attributes
      get :edit, {:id => text_pin.to_param}, valid_session
      assigns(:text_pin).should eq(text_pin)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TextPin" do
        expect {
          post :create, {:text_pin => valid_attributes}, valid_session
        }.to change(TextPin, :count).by(1)
      end

      it "assigns a newly created text_pin as @text_pin" do
        post :create, {:text_pin => valid_attributes}, valid_session
        assigns(:text_pin).should be_a(TextPin)
        assigns(:text_pin).should be_persisted
      end

      it "redirects to the created text_pin" do
        post :create, {:text_pin => valid_attributes}, valid_session
        response.should redirect_to(TextPin.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved text_pin as @text_pin" do
        # Trigger the behavior that occurs when invalid params are submitted
        TextPin.any_instance.stub(:save).and_return(false)
        post :create, {:text_pin => { "title" => "invalid value" }}, valid_session
        assigns(:text_pin).should be_a_new(TextPin)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TextPin.any_instance.stub(:save).and_return(false)
        post :create, {:text_pin => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested text_pin" do
        text_pin = TextPin.create! valid_attributes
        # Assuming there are no other text_pins in the database, this
        # specifies that the TextPin created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TextPin.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => text_pin.to_param, :text_pin => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested text_pin as @text_pin" do
        text_pin = TextPin.create! valid_attributes
        put :update, {:id => text_pin.to_param, :text_pin => valid_attributes}, valid_session
        assigns(:text_pin).should eq(text_pin)
      end

      it "redirects to the text_pin" do
        text_pin = TextPin.create! valid_attributes
        put :update, {:id => text_pin.to_param, :text_pin => valid_attributes}, valid_session
        response.should redirect_to(text_pin)
      end
    end

    describe "with invalid params" do
      it "assigns the text_pin as @text_pin" do
        text_pin = TextPin.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TextPin.any_instance.stub(:save).and_return(false)
        put :update, {:id => text_pin.to_param, :text_pin => { "title" => "invalid value" }}, valid_session
        assigns(:text_pin).should eq(text_pin)
      end

      it "re-renders the 'edit' template" do
        text_pin = TextPin.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TextPin.any_instance.stub(:save).and_return(false)
        put :update, {:id => text_pin.to_param, :text_pin => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested text_pin" do
      text_pin = TextPin.create! valid_attributes
      expect {
        delete :destroy, {:id => text_pin.to_param}, valid_session
      }.to change(TextPin, :count).by(-1)
    end

    it "redirects to the text_pins list" do
      text_pin = TextPin.create! valid_attributes
      delete :destroy, {:id => text_pin.to_param}, valid_session
      response.should redirect_to(text_pins_url)
    end
  end

end
