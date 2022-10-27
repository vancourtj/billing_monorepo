require "rails_helper"

RSpec.describe BillingAddressesController, type: :controller do
  describe "#index" do
    context "when there are no BillingAddresses" do
      render_views

      it "renders the no saved billing addresses text" do
        get :index

        expect(response.body).to include("There are no saved Billing Addresses")
      end
    end

    context "when there are BillingAddresses" do
      it "orders them by created_at desc" do
        ba1 = create(:billing_address)
        ba2 = create(:billing_address)

        get :index

        expect(assigns(:billing_addresses).first).to eq(ba2)
        expect(assigns(:billing_addresses).last).to eq(ba1)
      end
    end
  end

  describe "#create" do
    context "when the params are valid" do
      let(:params) do
        {
          billing_address: {
            name: "Alexander Hamilton",
            email_address: "punched@the.bursar",
            phone_number: "1234567890",
            street_address: "123 East Main St.",
            city: "Columbus",
            state: "OH",
            zip: "12345"
          }
        }
      end

      it "creates a new BillingAddress" do
        expect { post :create, params: params }.to change(BillingAddress, :count).by(1)

        expect(BillingAddress.last.attributes.except("id", "created_at", "updated_at")).to eq(params[:billing_address].with_indifferent_access)
      end

      it "redirects to the success page" do
        post :create, params: params

        expect(response).to redirect_to(success_path)
      end
    end

    context "when the params are invalid" do
      let(:params) do
        {
          billing_address: {
            name: "Alexander Hamilton",
            email_address: "punched@the.bursar",
            phone_number: "123",
            street_address: "123 East Main St.",
            city: "Columbus",
            state: "OH",
            zip: "12345"
          }
        }
      end

      it "does not create a new BillingAddress" do
        expect { post :create, params: params }.to change(BillingAddress, :count).by(0)
      end

      it "returns a 422" do
        post :create, params: params

        expect(response.code).to eq("422")
      end
    end
  end
end
