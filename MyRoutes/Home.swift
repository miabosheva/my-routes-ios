import SwiftUI
import MapKit

struct Home: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var homeModel = HomeModel()
    @State private var showSheet = true

    // Delete later
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Initial location (San Francisco)
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack {
                    
                    Map(coordinateRegion: $homeModel.region,
                        interactionModes: [.all],
                        annotationItems: [homeModel.places])
                            { place in
                                MapMarker(coordinate: place.coordinate,
                                       tint: Color.purple)
                            }
                            .offset(y: -220)
                }
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Skopje, Macedonia")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showSheet) {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    // MARK: - Sheet Header
                    
                    HStack {
                        Button {
                            showSheet = false
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            HStack {
                                Button {
                                    // TODO: - Navigate to Find Routes
                                } label: {
                                    RoundedRectangle(cornerRadius: 40)
                                        .frame(width: 200, height: 40)
                                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                        .overlay{
                                            Text("Find Routes")
                                                .foregroundColor(.white)
                                        }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 8)
                    
                    HStack {
                        Text("Suggested Routes")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    // MARK: - Route Cards
                    
                    ForEach(1..<5) { number in
                        Button {
                            // TODO: - Actions for tapping on a suggested route
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 73)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .overlay{
                                    HStack (spacing: 16){
                                        Circle()
                                            .frame(width: 35, height: 35)
                                            .foregroundColor(.purple)
                                            .padding(.leading, 16)
                                        
                                        VStack (alignment: .leading) {
                                            Text("Route Number \(number)")
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                            Text("30 min")
                                                .foregroundColor(.secondary)
                                                .multilineTextAlignment(.leading)
                                        }
                                        Spacer()
                                    }
                                }
                        }
                    }
                    .padding(.bottom, 8)
                    
                    HStack {
                        Text("Places Around Me")
                            .font(.system(size: 18))
                            .foregroundColor(.secondary)
                        Spacer()
                        
                        Button("More") {
                            // TODO: - Go to places around me
                        }
                    }
                    
                    ForEach(1..<3) { number in
                        Button {
                            // TODO: - Actions for tapping on a suggested route
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 73)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .overlay{
                                    HStack (spacing: 16){
                                        Circle()
                                            .frame(width: 35, height: 35)
                                            .foregroundColor(.pink)
                                            .padding(.leading, 16)
                                        
                                        VStack (alignment: .leading) {
                                            Text("Restaurant \(number)")
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                            Text("30 min")
                                                .foregroundColor(.secondary)
                                                .multilineTextAlignment(.leading)
                                        }
                                        Spacer()
                                    }
                                }
                        }
                    }
                    .padding(.bottom, 8)
                }
                .presentationDetents([.medium,.large])
//                .presentationBackground(.regularMaterial)
                .interactiveDismissDisabled()
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
            }
        }
    }
}

#Preview {
    Home()
}
