//
//  CommentsOnPostsVC.swift
//  AppTask2
//
//  Created by Ashu on 03/04/23.
//

import UIKit

class CommentsOnPostsVC: UIViewController {

    @IBOutlet weak var commentsOnPostsTableView: UITableView!
    var checkAlbumOrPostClick: checkSelect = .commentOnPost
    var showHeader: Bool = false
    // MARK: - commentonposts
    var commentsOnThePostsViewModel2 = CommentsOnPostsViewModel()
    var commentpostId = ""
    // MARK: - Posts data of comments
    var postCommentTitle = ""
    var postCommentDescription = ""
    // MARK: - counts of the comments
    
    var commentsCount = 1
    
    var chealbumOrPosts: checkAlbumOrPostsClicked = .posts
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsOnThePostsViewModel2.id = Int(commentpostId)!
        commentsCount = commentsOnThePostsViewModel2.commentsOnPostsData.count
        initialize()
        // Do any additional setup after loading the view.
    }
     
    @IBAction func backButtonAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func initialize(){
        commentsOnPostsTableView.delegate=self
        commentsOnPostsTableView.dataSource = self
        commentsOnPostsTableView.register(UINib(nibName: "CommentsOnPostsCell", bundle: nil), forCellReuseIdentifier: "CommentsOnPostsCell")
        commentsOnPostsTableView.register(UINib(nibName: "CommentsOnPostsHeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "CommentsOnPostsHeaderCell")
        commentsOnPostsTableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        commentsOnPostsTableView.estimatedRowHeight = UITableView.automaticDimension
        getCommentsOnPosts()
    }
    
    
    // MARK: - comments on the posts function for calling Api
    func getCommentsOnPosts(){
        Utility.showIndicator()
        commentsOnThePostsViewModel2.getCommentsOnPosts{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                self.commentsOnPostsTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CommentsOnPostsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commentsOnThePostsViewModel2.commentsOnPostsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch checkAlbumOrPostClick{
        case .commentOnPost:
            let cell = commentsOnPostsTableView.dequeueReusableCell(withIdentifier: "CommentsOnPostsCell", for: indexPath) as! CommentsOnPostsCell
            cell.setCommentOnPostData(commentsOnThePostsViewModel2.commentsOnPostsData[indexPath.row])
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if showHeader == true{
            let header = commentsOnPostsTableView.dequeueReusableHeaderFooterView(withIdentifier: "CommentsOnPostsHeaderCell") as! CommentsOnPostsHeaderCell
            //getpostsIdFromAPI()
            header.setCommentOnPostsHeaderData(postCommentTitle, postCommentDescription,commentsOnThePostsViewModel2.commentsOnPostsData.count)
            //header.count = commentsCount
            return header
        }else{
            return UITableViewHeaderFooterView()
        }
       
       
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
