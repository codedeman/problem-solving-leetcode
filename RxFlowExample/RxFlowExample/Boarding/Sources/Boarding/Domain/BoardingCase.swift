//
//  File.swift
//  
//
//  Created by Kien Trung Pham on 11/1/23.
//

import Foundation
import RxSwift

protocol BoardingUseCase: AnyObject {
    func getOfferResponse(urlStr: String) -> Observable<OfferResponse>
}

final class DBBoardingUseCase: BoardingUseCase {
   
    private let boardingRepository: BoadingRepository
    
    init(boardingRepository: BoadingRepository) {
        self.boardingRepository = boardingRepository
    }
    
    func getOfferResponse(urlStr: String) -> Observable<OfferResponse> {
        guard let url = URL(string: urlStr)  else {return Observable.empty()}
        let urlRq = URLRequest(url: url)
        return boardingRepository.send(urlRequest: urlRq)
    }

}
