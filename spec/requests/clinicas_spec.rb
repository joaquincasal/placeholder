require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/clinicas", type: :request do
  include Devise::Test::IntegrationHelpers

  # This should return the minimal set of attributes required to create a valid
  # Clinica. As you add validations to Clinica, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { codigo: 1234, nombre: "Nombre clinica" }
  end

  before { sign_in Usuario.new }

  describe "GET /index" do
    it "renders a successful response" do
      Clinica.create! valid_attributes
      get clinicas_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_clinica_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      clinica = Clinica.create! valid_attributes
      get edit_clinica_url(clinica)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Clinica" do
        expect do
          post clinicas_url, params: { clinica: valid_attributes }
        end.to change(Clinica, :count).by(1)
      end

      it "redirects to the clinicas list" do
        post clinicas_url, params: { clinica: valid_attributes }
        expect(response).to redirect_to(clinicas_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Clinica" do
        Clinica.create! valid_attributes
        expect do
          post clinicas_url, params: { clinica: valid_attributes }
        end.not_to change(Clinica, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        Clinica.create! valid_attributes
        post clinicas_url, params: { clinica: valid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { nombre: "Nuevo nombre" } }

      it "updates the requested clinica" do
        clinica = Clinica.create! valid_attributes
        patch clinica_url(clinica), params: { clinica: new_attributes }
        clinica.reload
        expect(clinica.nombre).to eq "Nuevo nombre"
      end

      it "redirects to the clinica list" do
        clinica = Clinica.create! valid_attributes
        patch clinica_url(clinica), params: { clinica: new_attributes }
        expect(response).to redirect_to(clinicas_url)
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        Clinica.create! valid_attributes
        clinica = Clinica.create! valid_attributes.merge(codigo: 1)
        patch clinica_url(clinica), params: { clinica: { codigo: valid_attributes[:codigo] } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
