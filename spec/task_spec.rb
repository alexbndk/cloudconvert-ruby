require "spec_helper"

describe CloudConvert::Task do
  id1 = SecureRandom.uuid, id2 = SecureRandom.uuid
  url = "https://api.cloudconvert.com/v2/tasks/#{id1}"

  describe "#==" do
    it "returns true when objects IDs are the same" do
      user = CloudConvert::Task.new(id: id1, operation: "convert")
      other = CloudConvert::Task.new(id: id1, operation: "optimize")
      expect(user == other).to be true
    end
    it "returns false when objects IDs are different" do
      user = CloudConvert::Task.new(id: id1)
      other = CloudConvert::Task.new(id: id2)
      expect(user == other).to be false
    end
    it "returns false when classes are different" do
      user = CloudConvert::Task.new(id: id1)
      other = CloudConvert::Job.new(id: id1)
      expect(user == other).to be false
    end
  end

  describe "#operation" do
    it "returns value when operation is set" do
      user = CloudConvert::Task.new(operation: "convert")
      expect(user.operation).to be :convert
    end
    it "returns nil when operation is not set" do
      user = CloudConvert::Task.new()
      expect(user.operation).to be_nil
    end
  end

  describe "#status" do
    it "returns value when status is set" do
      user = CloudConvert::Task.new(status: "pending")
      expect(user.status).to be :pending
    end
    it "returns nil when status is not set" do
      user = CloudConvert::Task.new()
      expect(user.status).to be_nil
    end
  end

  describe "#links" do
    it "returns struct when links is set" do
      user = CloudConvert::Task.new(links: { self: url })
      expect(user.links).to eq OpenStruct.new(self: url)
    end
    it "returns nil when links is not set" do
      user = CloudConvert::Task.new()
      expect(user.links).to be_nil
    end
  end

  describe "#created_at" do
    it "returns a Time when created_at is set" do
      user = CloudConvert::Task.new(created_at: "Mon Jul 16 12:59:01 +0000 2020")
      expect(user.created_at).to be_a Time
      expect(user.created_at).to be_utc
    end
    it "returns nil when created_at is not set" do
      user = CloudConvert::Task.new()
      expect(user.created_at).to be_nil
    end
  end

  describe "#created?" do
    it "returns true when created_at is set" do
      user = CloudConvert::Task.new(created_at: "Mon Jul 16 12:59:01 +0000 2020")
      expect(user.created?).to be true
    end
    it "returns false when created_at is not set" do
      user = CloudConvert::Task.new()
      expect(user.created?).to be false
    end
  end

  describe "#started_at" do
    it "returns a Time when started_at is set" do
      user = CloudConvert::Task.new(started_at: "Mon Jul 16 12:59:01 +0000 2020")
      expect(user.started_at).to be_a Time
      expect(user.started_at).to be_utc
    end
    it "returns nil when started_at is not set" do
      user = CloudConvert::Task.new()
      expect(user.started_at).to be_nil
    end
  end

  describe "#started?" do
    it "returns true when started_at is set" do
      user = CloudConvert::Task.new(started_at: "Mon Jul 16 12:59:01 +0000 2020")
      expect(user.started?).to be true
    end
    it "returns false when started_at is not set" do
      user = CloudConvert::Task.new()
      expect(user.started?).to be false
    end
  end

  describe "#ended_at" do
    it "returns a Time when ended_at is set" do
      user = CloudConvert::Task.new(ended_at: "Mon Jul 16 12:59:01 +0000 2020")
      expect(user.ended_at).to be_a Time
      expect(user.ended_at).to be_utc
    end
    it "returns nil when ended_at is not set" do
      user = CloudConvert::Task.new()
      expect(user.ended_at).to be_nil
    end
  end

  describe "#ended?" do
    it "returns true when ended_at is set" do
      user = CloudConvert::Task.new(ended_at: "Mon Jul 16 12:59:01 +0000 2020")
      expect(user.ended?).to be true
    end
    it "returns false when ended_at is not set" do
      user = CloudConvert::Task.new()
      expect(user.ended?).to be false
    end
  end
end
