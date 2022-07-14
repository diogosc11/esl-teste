require 'rails_helper' 

describe Reserve do 
  it "can create a new user" do
    user = User.new({email: "user#{rand()}@example.com", password: "123456"})

    expect(user).to be_valid 
  end
  it "its valid when datetime and description is present" do
    User.create({email: "user@example.com", password: "123456"})
    user = User.first
    reserve = Reserve.new( 
      datetime: '16/07/2022 06:00', 
      description: 'blablablablabla',
      user_id: user.id,
    )    
    expect(reserve).to be_valid 
  end
  it "its not valid when datetime is nil" do
    user = User.create({email: "user#{rand()}@example.com", password: "123456"})
    reserve = Reserve.create( 
      datetime: nil, 
      description: 'blablablablabla',
      user_id: user.id,
    )
    expect(reserve.errors.full_messages[0]).to include("can't be blank")
  end
  it "its not valid when description is nil" do
    user = User.create({email: "user#{rand()}@example.com", password: "123456"})
    reserve = Reserve.create( 
      datetime: '16/07/2022 06:00', 
      description: nil,
      user_id: user.id,
    )
    expect(reserve.errors.full_messages[0]).to include("can't be blank")
  end
  it "its not valid when user is nil" do
    user = User.create({email: "user#{rand()}@example.com", password: "123456"})
    reserve = Reserve.create( 
      datetime: '16/07/2022 06:00', 
      description: 'blablablablabla',
      user_id: nil,
    )
    expect(reserve.errors.full_messages[0]).to include("must exist")
  end
  it "its not valid when datetime already taken" do
    user = User.first
    reserve = Reserve.create( 
      datetime: '16/07/2022 06:00', 
      description: 'blablablablabla',
      user_id: 3,
    )
    reserve2 = Reserve.create( 
      datetime: '16/07/2022 06:00', 
      description: 'blablablablabla',
      user_id: 3,
    )
    expect(reserve2.errors.full_messages[0]).to include("already been taken")
  end
end
