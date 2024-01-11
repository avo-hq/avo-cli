class Avo::Resources::Account < Avo::BaseResource
  self.includes = [:owner, :charges, :users]
  self.fake = true
  self.search = {
    query: -> {
      query.ransack(id_eq: params[:q], name_cont: params[:q], m: "or").result(distinct: false).includes(:owner)
    },
    item: -> {
      owner = record.owner
      {
        title: record.name,
        description: "Owner: #{owner.name}. Licenses: #{record.licenses.count}. Pay customers: #{record&.pay_customers&.count}",
        image_url: view_context.gravatar_image_url(owner.email)
      }
    }
  }

  field :bad_name, as: :text

  def fields
    field :id, as: :id
    field :name, as: :text
    # field :owner, as: :belongs_to
    # field :personal, as: :boolean
    # field :charges_count, as: :number, only_on: [:index] do
    #   record.charges.length
    # end
    # field :users_count, as: :number, only_on: [:index] do
    #   record.users.length
    # end
    # field :subscriptions, as: :has_many
    # field :pay_customers, as: :has_many
    # field :charges, as: :has_many
    # field :users, as: :has_many, through: :account_users
    # field :account_users, as: :has_many
  end
end
